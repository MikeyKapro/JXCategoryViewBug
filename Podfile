# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'JXCategoryViewBug' do
  use_frameworks!
  
  pod 'JXCategoryView'
  pod 'Masonry'

end

deployment_target = '14.0'
platform :ios, deployment_target

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
                config.build_settings['CODE_SIGN_IDENTITY'] = ''
                if config.name == 'Debug'
                  config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = "arm64"
                  config.build_settings['ARCHS[sdk=iphonesimulator*]'] = 'x86_64'
                elsif config.name == 'AppStore'
#                  config.build_settings['ENABLE_BITCODE'] = 'YES'
                end
            end
        end
        project.build_configurations.each do |bc|
            bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
            bc.build_settings['CODE_SIGN_IDENTITY'] = ''
            if bc.name == 'Debug'
              bc.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = "arm64"
              bc.build_settings['ARCHS[sdk=iphonesimulator*]'] = 'x86_64'
            elsif bc.name == 'AppStore'
#              bc.build_settings['ENABLE_BITCODE'] = 'YES'
            end
        end
    end
end
