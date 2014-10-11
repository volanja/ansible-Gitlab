describe command('cat /home/git/.rbenv/version') do
  it { should return_stdout '2.1.2' }
end


