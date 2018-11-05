module ContractMacros
  def it_should_not_have_validation_error
    it 'does not have any validation error' do
      actual_properties  = model_class.columns_hash.keys
      virtual_properties = valid_params.keys - actual_properties

      model = model_class.new
      actual_properties.each do |actual_property|
        model.send("#{actual_property}=", valid_params[actual_property.to_sym])
      end

      form = contract_class.new(model)
      virtual_properties.each do |virtual_property|
        form.send("#{virtual_property}=", valid_params[virtual_property.to_sym])
      end

      expect(form.valid?).to eq true
    end
  end

  def it_should_have_validation_error
    it 'has a validation error' do
      actual_properties  = model_class.columns_hash.keys
      virtual_properties = valid_params.keys - actual_properties

      model = model_class.new
      actual_properties.each do |actual_property|
        if actual_property == target_property
          model.send("#{target_property}=", target_value)
        else
          model.send("#{actual_property}=", valid_params[actual_property.to_sym])
        end
      end

      form = contract_class.new(model)
      virtual_properties.each do |virtual_property|
        if virtual_property == target_property
          form.send("#{target_property}=", target_value)
        else
          form.send("#{virtual_property}=", valid_params[virtual_property.to_sym])
        end
      end

      expect(form.valid?).to be false
      expect(form.errors.added?(target_property, *error_message_args)).to be true
    end
  end
end
