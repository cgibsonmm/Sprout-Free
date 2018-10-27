class UsernameValidator < ActiveModel::Validator
  include TheBigUsernameBlacklist

  def validate(record)
    unless username_valid?(record.username)
      record.errors[:username] << 'is blacklisted!'
    end
  end
end
