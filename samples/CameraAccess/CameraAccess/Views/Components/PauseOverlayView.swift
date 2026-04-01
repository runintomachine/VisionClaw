import SwiftUI

struct PauseOverlayView: View {
  let onResume: () -> Void
  let onEnd: () -> Void

  var body: some View {
    ZStack {
      // Full-screen tap target to resume
      Color.black
        .ignoresSafeArea()
        .onTapGesture {
          onResume()
        }

      // Center content
      VStack(spacing: 20) {
        // Pause bars (like Gemini app)
        HStack(spacing: 10) {
          RoundedRectangle(cornerRadius: 4)
            .frame(width: 16, height: 48)
          RoundedRectangle(cornerRadius: 4)
            .frame(width: 16, height: 48)
        }
        .foregroundColor(.white)

        Text("Gemini ist pausiert")
          .font(.title2)
          .fontWeight(.semibold)
          .foregroundColor(.white)

        Text("Tippe auf den Bildschirm um fortzufahren,\noder beende die Sitzung")
          .font(.body)
          .foregroundColor(Color.white.opacity(0.6))
          .multilineTextAlignment(.center)
      }

      // Bottom bar: matches Gemini app layout
      VStack {
        Spacer()
        HStack {
          Spacer()
          Button(action: onEnd) {
            Image(systemName: "xmark")
              .font(.title2.weight(.semibold))
              .foregroundColor(.white)
              .frame(width: 68, height: 68)
              .background(Color.red)
              .clipShape(RoundedRectangle(cornerRadius: 22))
          }
          .padding(.trailing, 24)
          .padding(.bottom, 48)
        }
      }
    }
  }
}
