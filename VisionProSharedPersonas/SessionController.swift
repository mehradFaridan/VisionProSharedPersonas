// SessionController.swift

import Foundation
import GroupActivities
import Observation


@Observable @MainActor
class SessionController {
    let session: GroupSession<TestActivity>
    let messenger: GroupSessionMessenger
    let systemCoordinator: SystemCoordinator



    init?(_ session: GroupSession<TestActivity>, appModel: AppModel) async {
        guard let systemCoordinator = await session.systemCoordinator else {
            return nil
        }

        self.session = session
        self.messenger = GroupSessionMessenger(session: session)
        self.systemCoordinator = systemCoordinator

        self.localPlayer = PlayerModel(
            id: session.localParticipant.id,
            name: appModel.playerName
        )
        appModel.showPlayerNameAlert = localPlayer.name.isEmpty

        observeRemoteParticipantUpdates()
        configureSystemCoordinator()

        self.session.join()
    }




    func configureSystemCoordinator() {
        systemCoordinator.configuration.supportsGroupImmersiveSpace = true

        Task {
            for await localParticipantState in systemCoordinator.localParticipantStates {
                localPlayer.seatPose = localParticipantState.seat?.pose
            }
        }
    }
}
