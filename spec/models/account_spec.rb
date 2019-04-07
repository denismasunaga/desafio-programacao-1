require 'spec_helper'

RSpec.describe Account do

  subject { described_class.new(name: "Marcelo", email: "marcelo@gmail.com", role: "user", uid: "123123123", provider: "facebook")}

  it "é valido se todos os atributos estiverem presentes e se o email tiver formato válido" do
    expect(subject).to be_valid
  end

  it "não é valido se algum dos campos estive faltando" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "não é valido se o email não estiver em um formato válido" do
    subject.email = "marcelo.com"
    expect(subject).to_not be_valid
  end

end
