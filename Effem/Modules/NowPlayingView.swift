//
//  NowPlayingView.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/27/24.
//

import SwiftUI

struct NowPlayingView: View {
    var body: some View {
        VStack {
            EpisodeArtworkView()
            EpisodeDetailsView()
            PlaybackControlsView()
        }
        .commonView()
        .presentationDragIndicator(.visible)
    }
}

fileprivate struct PlaybackControlsView: View {
    @Environment(MediaPlaybackManager.self) private var mediaPlaybackManager
    @State private var goBackTrigger = PlainTaskTrigger()
    @State private var playPauseTrigger = PlainTaskTrigger()
    @State private var skipAheadTrigger = PlainTaskTrigger()
    
    var body: some View {
        VStack {
            AudioProgressView()
            
            HStack {
                Button(action: triggerGoBack) {
                    Image(systemName: "gobackward.15")
                }
                .padding(.trailing)
                
                Button(action: triggerPlayPause) {
                    Image(systemName: mediaPlaybackManager.isPlaying ? "pause.fill" : "play.fill")
                }
                .padding(.horizontal)
                
                Button(action: triggerSkipAhead) {
                    Image(systemName: "goforward.30")
                }
                .padding(.leading)
            }
            .font(.title)
            .task($goBackTrigger) { await goBack() }
            .task($playPauseTrigger) { await playPause() }
            .task($skipAheadTrigger) { await skipAhead() }
        }
    }
    
    private func triggerPlayPause() {
        playPauseTrigger.trigger()
    }
    
    private func playPause() async {
        mediaPlaybackManager.playPause()
    }
    
    private func triggerSkipAhead() {
        skipAheadTrigger.trigger()
    }
    
    private func skipAhead() async {
        mediaPlaybackManager.skipAhead30()
    }
    
    private func triggerGoBack() {
        goBackTrigger.trigger()
    }
    
    private func goBack() async {
        mediaPlaybackManager.goBack15()
    }
}

fileprivate struct EpisodeDetailsView: View {
    @Environment(MediaPlaybackManager.self) private var mediaPlaybackManager
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("12/31/87")
                    .font(.subheadline)
                Text("title")
                    .font(.headline)
                Text("something")
//                    .setForegroundStyle()
            }
            
            Spacer()
        }
        .padding(.leading, 40)
        .padding(.top)
    }
}

fileprivate struct EpisodeArtworkView: View {
    @Environment(MediaPlaybackManager.self) private var mediaPlaybackManager
    @State private var height: CGFloat?
    
    var body: some View {
        AsyncImage(url: URL(string: ""), content: {
            $0
                .resizable()
                .scaledToFill()
        }, placeholder: {
            ZStack {
                Rectangle()
                    .fill(.gray)
                    .overlay(Material.ultraThin)
                ProgressView()
            }
        })
        .cornerRadius(20)
        .frame(maxWidth: .infinity)
        .background(GeometryReader { Color.clear.preference(key: WidthKey.self, value: $0.size.width) })
        .padding(.horizontal, 40)
        .onPreferenceChange(WidthKey.self) { height = $0 }
        .frame(height: height)
        .shadow(radius: 20)
    }
}

fileprivate struct AudioProgressView: View {
    @Environment(MediaPlaybackManager.self) private var mediaPlaybackManager
    
    var body: some View {
        VStack {
            PlaybackSlider()
                .padding(12)
            
            HStack {
                Text(mediaPlaybackManager.currentTime)
                Spacer()
                Text(mediaPlaybackManager.timeRemaining)
            }
            .font(.system(size: 11))
        }
        .padding()
    }
}

fileprivate struct WidthKey: PreferenceKey {
    static let defaultValue: CGFloat? = nil
    
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        value = value ?? nextValue()
    }
}

#Preview {
    Text("test")
        .sheet(isPresented: .constant(true)) {
            NowPlayingView()
                .environment(MediaPlaybackManager())
        }
}

