describe 'bundler-bouncer' do
  
  context 'from a file invoked with `bundle exec`' do
    it 'should exit with status 0'
    it 'should print nothing to stderr'
  end
  
  context 'from a file invoked without `bundle exec`' do
    context 'with USE_BUNDLER set to no' do
      it 'should exit with status 0'
      it 'should print a warning to stderr'
    end
    
    context 'with USE_BUNDLER not set to no' do
      it 'should exit with status 1'
      it 'should print an explanation to stderr'
    end
  end
  
end
