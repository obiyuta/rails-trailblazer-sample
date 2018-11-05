module PolicyMacros
  def it_should_be_authorized
    it 'should return true' do
      result = described_class.new(current_user, model).send(target_method)
      expect(result).to eq true
    end
  end

  def it_should_not_be_uauthorized
    it 'should return false' do
      result = described_class.new(current_user, model).send(target_method)
      expect(result).to eq false
    end
  end
end
