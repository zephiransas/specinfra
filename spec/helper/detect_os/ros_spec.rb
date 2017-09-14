require 'spec_helper'
require 'specinfra/helper/detect_os/ros'

describe Specinfra::Helper::DetectOs::Ros do
  ros = Specinfra::Helper::DetectOs::Ros.new(:exec)
  it 'Should return ros 1.0.3 when rancherOS 1.0.3 is installed.' do
    allow(ros).to receive(:run_command) {
      CommandResult.new(:stdout => "NAME=\"Rancher OS\"\nVERSION=v1.0.3\nID=rancheros\nID_LIKE=\nVERSION_ID=v1.0.3\nPRETTY_NAME=\"RancherOS v1.0.3\"", :exit_status => 0)
    }
    expect(ros.detect).to include(
                               :family  => 'ros',
                               :release => '1.0.3'
                           )
  end
end