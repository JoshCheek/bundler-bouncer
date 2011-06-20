require "#{File.dirname __FILE__}/spec_helper"
describe 'bundler-bouncer' do
  
  context 'from a file invoked with `bundle exec`' do
    subject { run_app 'with_bundler', :bundler => true }
    its(:exitstatus) { should be_zero }
    its(:stderr)     { should == '' }
    its(:stdout)     { should == '' }
  end
  
  context 'from a file invoked without `bundle exec`' do
    context 'with USE_BUNDLER set to no' do
      it 'should exit with status 0'
      it 'should print a warning to stderr'
    end
    
    context 'with USE_BUNDLER set to force' do
      subject { run_app 'without_bundler', :bundler => false, :USE_BUNDLER => 'force' }
      its(:exitstatus)  { should == 1 }
      its(:stdout)      { should == '' }
      its(:stderr)      { should == bouncer_message(:missing_bundler) }
    end
  end
  
end
