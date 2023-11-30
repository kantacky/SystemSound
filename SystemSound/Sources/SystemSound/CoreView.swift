import AudioToolbox
import SwiftUI

struct CoreView: View {
    @State private var soundId: Int
    private var systemSoundOptions: [Int]

    init() {
        self.soundId = 1000
        self.systemSoundOptions = []
        self.systemSoundOptions.append(contentsOf: Array(1000...1016))
        self.systemSoundOptions.append(contentsOf: Array(1020...1036))
        self.systemSoundOptions.append(contentsOf: Array(1050...1057))
        self.systemSoundOptions.append(contentsOf: Array(1070...1075))
        self.systemSoundOptions.append(contentsOf: Array(1100...1118))
        self.systemSoundOptions.append(contentsOf: Array(1150...1154))
        self.systemSoundOptions.append(contentsOf: Array(1200...1211))
        self.systemSoundOptions.append(contentsOf: Array(1254...1259))
        self.systemSoundOptions.append(contentsOf: Array(1300...1315))
        self.systemSoundOptions.append(contentsOf: Array(1320...1336))
        self.systemSoundOptions.append(contentsOf: Array(1350...1351))
        self.systemSoundOptions.append(4095)
    }

    var body: some View {
        VStack(spacing: 16) {
            Text("System Sounds")
                .font(.title)
                .bold()

            Picker("Sound ID", selection: self.$soundId) {
                ForEach(0..<self.systemSoundOptions.count) {
                    Text(String(self.systemSoundOptions[$0]))
                        .tag(self.systemSoundOptions[$0])
                }
            }
            .pickerStyle(.wheel)

            
            Button {
                AudioServicesPlaySystemSound(SystemSoundID(self.soundId))
            } label: {
                Label("Play", systemImage: "play.circle")
            }

            Button {
                Task {
                    AudioServicesPlaySystemSound(SystemSoundID(1009))
                    try await Task.sleep(nanoseconds: 2_000_000_000)
                    AudioServicesPlaySystemSound(SystemSoundID(1005))
                }
            } label: {
                Label("Starbucks Mobile Order & Pay", systemImage: "cup.and.saucer")
            }

            Button {
                Task {
                    AudioServicesPlaySystemSound(SystemSoundID(1034))
                }
            } label: {
                Label("Starbucks Uber Eats", systemImage: "cup.and.saucer")
            }

            Button {
                AudioServicesPlaySystemSound(SystemSoundID(4095))
            } label: {
                Label("Vibration", systemImage: "iphone.homebutton.radiowaves.left.and.right")
            }
        }
    }
}

#Preview {
    CoreView()
}
