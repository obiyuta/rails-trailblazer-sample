class TransactionBlock
  def self.call((_ctx), *, &block)
    ApplicationRecord.transaction do
      block.call
    end
  end
end
