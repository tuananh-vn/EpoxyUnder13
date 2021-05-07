platform :ios, '10.0'
workspace 'EpoxyIOSWithoutSwiftUI.xcworkspace'

project 'EpoxyExample/EpoxyExample.xcodeproj'
project 'EpoxyCooked/EpoxyCooked.xcodeproj'

#$TekoSpec = 'https://' + ENV['GITHUB_USER_TOKEN'] + '@github.com/teko-vn/Specs-ios.git'   # for using pods from Teko
#
#source 'https://github.com/CocoaPods/Specs.git' # for using pods from cocoaPods
#source $TekoSpec

$non_distribution_frameworks = [
  "GRPC-Swift",
  "SwiftNIO"
]

# bitcode enable
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|

      # delete CODE_SIGNING_ALLOWED && CODE_SIGNING_REQUIRED
      config.build_settings.delete('CODE_SIGNING_ALLOWED')
      config.build_settings.delete('CODE_SIGNING_REQUIRED')
      
      # set valid architecture
      config.build_settings['VALID_ARCHS'] = 'arm64 armv7 armv7s x86_64'

      # build active architecture only (Debug build all)
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'

      config.build_settings['ENABLE_BITCODE'] = 'YES'
      
      # Xcode12 have to exclude arm64 for simulator architecture
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"

      if config.name == 'Release' || config.name == 'Pro'
          config.build_settings['BITCODE_GENERATION_MODE'] = 'bitcode'
      else # Debug
          config.build_settings['BITCODE_GENERATION_MODE'] = 'marker'
      end

      cflags = config.build_settings['OTHER_CFLAGS'] || ['$(inherited)']

      if config.name == 'Release' || config.name == 'Pro'
          cflags << '-fembed-bitcode'
      else # Debug
          cflags << '-fembed-bitcode-marker'
      end

      config.build_settings['OTHER_CFLAGS'] = cflags
    end
  end
end

def epoxyCookedPod
end

def epoxyExamplePod
  pod 'DeviceKit'
end

target 'EpoxyExample' do
  project 'EpoxyExample/EpoxyExample.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  epoxyExamplePod
  # Pods for EpoxyExample

end

target 'EpoxyCooked' do
  project 'EpoxyCooked/EpoxyCooked.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for EpoxyCooked
  epoxyCookedPod

end
