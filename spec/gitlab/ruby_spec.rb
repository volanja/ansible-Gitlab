describe command('cat /home/git/.rbenv/version') do
  it { should return_stdout '2.0.0-p353' }
end


