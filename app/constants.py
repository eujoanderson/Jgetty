installer_switches = ['Silent', 'SilentWithProgress', 'Interactive', 'InstallLocation', 'Log', 'Upgrade', 'Custom', 'RequireExplicitUpgrade', 'Dependencies']
architectures = [('x86', 'x86'), ('x64', 'x64'), ('arm', 'arm'), ('arm64', 'arm64')]
simplified_architectures = [arch[1] for arch in architectures]
installer_types = [('exe', 'exe'), ('msi', 'msi'), ('msix', 'msix'), ('appx', 'appx'), ('zip', 'zip (nested installer)'), ('inno', 'inno'), ('nullsoft', 'nullsoft'), ('wix', 'wix'), ('burn', 'burn'), ('pwa', 'pwa'), ('msstore', 'msstore')]
simplified_installer_types = [inst[1] for inst in installer_types]
installer_scopes = [('user', 'user'), ('machine', 'machine'), ('both', 'both')]
simplified_installer_scopes = [scope[1] for scope in installer_scopes]
nested_installer_types = [('msi', 'msi'), ('msix', 'msix'), ('appx', 'appx'), ('exe', 'exe'), ('inno', 'inno'),('nullsoft', 'nullsoft'), ('wix', 'wix'), ('burn', 'burn'), ('portable','portable')]
simplified_nested_installer_types = [inst[1] for inst in nested_installer_types]
