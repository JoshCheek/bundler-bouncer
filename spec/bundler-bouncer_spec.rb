require "#{File.dirname __FILE__}/spec_helper"
describe 'bundler-bouncer' do
  
  context 'from a file invoked with `bundle exec`' do
    subject { run_app :bundler => true }
    its(:exitstatus) { should be_zero }
    its(:stderr)     { should == '' }
    its(:stdout)     { should == '' }
  end
  
  context 'from a file invoked without `bundle exec`' do
    context 'with USE_BUNDLER set to no' do
      subject { run_app :bundler => false, :USE_BUNDLER => 'no' }
      its(:exitstatus)  { should == 0 }
      its(:stdout)      { should == '' }
      its(:stderr)      { should == bouncer_message(:turned_off) }
      its(:stderr)      { should be_coloured :yellow }
    end
    
    context 'with USE_BUNDLER set to force' do
      subject { run_app :bundler => false, :USE_BUNDLER => 'force' }
      its(:exitstatus)  { should == 1 }
      its(:stdout)      { should == '' }
      its(:stderr)      { should == bouncer_message(:missing_bundler) }
      its(:stderr)      { should be_coloured :red }
    end
  end
  
end
