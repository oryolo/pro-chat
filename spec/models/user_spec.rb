RSpec.describe User do
  subject { User.new(email: 'name@mail.com', password: 'password',username: 'username_test') } 
  
  it "validates presence of username" do
    subject.username = nil
    expect(subject).to_not be_valid
    expect(subject.errors[:username]).to include("can't be blank")
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'validates uniqness of username' do 
    user = User.create!({email: 'name@mail.com', password: 'password', username: 'username_test'})
    expect(subject).to_not be_valid  
    expect(subject.errors[:username]).to include('has already been taken')
  end
end
