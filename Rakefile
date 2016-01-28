require 'amino'

task :default do
  retrieve_id_by_amino("AMIMOTO HHVM *")
  retrieve_id_by_amino("AMIMOTO MOD_PHP *")
  retrieve_id_by_amino("AMIMOTO HTTP2 *")
  retrieve_id_by_amino("AMIMOTO PVM *")
  retrieve_id_by_amino("AMIMOTO HVM *")
end

def retrieve_id_by_amino(query)
  ami = Amino({'name' => query, 'product-code.type' => "marketplace"}, {region: 'us-east-1'}).last
  $stderr.puts [ami.image_id, query, ami.name, ami.creation_date].join(": ")
end
