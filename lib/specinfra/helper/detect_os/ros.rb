class Specinfra::Helper::DetectOs::Ros < Specinfra::Helper::DetectOs
  def detect
    if run_command('ls /etc/os-release').success? and run_command('ros -v').success?
      line = run_command('cat /etc/os-release').stdout
      if line =~ /ID=rancheros/
        family = 'ros'
      end
      if line =~ /VERSION_ID=v(\d+\.\d+\.\d+)/
        release = $1
      end
      { :family => family, :release => release }
    end
  end
end