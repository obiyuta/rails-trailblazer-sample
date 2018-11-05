module ControllerMacros
  def login_administrator
    before do
      @request.env['devise.mapping'] = Devise.mappings[:administrator]
      sign_in create(:administrator)
    end
  end

  def login_participant
    before do
      @request.env['devise.mapping'] = Devise.mappings[:participant]
      sign_in create(:participant)
    end
  end
end
