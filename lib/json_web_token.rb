class JsonWebToken
 class << self
  JWT_SECRET = 'c5d4e9af92379381d3d03aba0c7c6388bce2c4235aad817b56649206b3fdd828fef083163905f28e9be8641ee24e1588601048dd214630750a3c93c11fe5f50c'

  def encode(payload, exp = 30.days.from_now)
     payload[:exp] = exp.to_i
     JWT.encode(payload, JWT_SECRET)
   end

   def decode(token)
     body = JWT.decode(token, JWT_SECRET)[0]
     HashWithIndifferentAccess.new body
   rescue
     nil
   end

 end
end
