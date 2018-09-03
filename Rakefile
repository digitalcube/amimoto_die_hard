require 'amino'

desc "show list of AMIMOTO AMIs"
task :default do
  # retrieve_id_by_amino("AMIMOTO HHVM *")
  retrieve_id_by_amino("AMIMOTO MOD_PHP *")
#  retrieve_id_by_amino("AMIMOTO HTTP2 *")
  # retrieve_id_by_amino("AMIMOTO PVM *")
  retrieve_id_by_amino("AMIMOTO HVM 5*")
  retrieve_id_by_amino("AMIMOTO WooCommerce HVM *")
  # retrieve_id_by_amino("AMIMOTO WooCommerce HHVM *")
  retrieve_id_by_amino("AMIMOTO WooCommerce MOD_PHP *")
end

task :all do
  retrieve_all_id_by_version("AMIMOTO*5.1.0*")
end

namespace :ec2 do
  @ec2 = Aws::EC2::Client.new
  desc "show list of tagged `amimoto-die-hard` instances"
  task :list do
    instances = get_tagged_instances
    instances.map {|i| puts [i.instance_id, i.tags].to_s }
  end

  desc "terminate all tagged `amimoto-die-hard` instances"
  task :terminate do
    instances = get_tagged_instances
    target = instances.map {|i| i.instance_id }
    ec2.terminate_instances(instance_ids: target)
  end

  def get_tagged_instances
    instances = @ec2.describe_instances.reservations.first.instances
    puts instances.size
    instances.select {|i| i.tags.first.value == 'amimoto-die-hard' && i.state.name == 'running' }
  end
end

def retrieve_id_by_amino(query)
  ami = Amino({'name' => query, 'product-code.type' => "marketplace"}, {region: 'us-east-1'}).last
  $stderr.puts [ami.image_id, query, ami.name, ami.creation_date].join(": ")
end

def retrieve_all_id_by_version(query)
  filters = []
  conds = {'name' => query, 'product-code.type' => "marketplace"}
  conds.each {|k,v| filters << {name: k, values: Array(v)} }

  all_amimoto = @ec2.describe_images(filters: filters)
  all_amimoto[0].map do |ami|
    $stderr.puts [ami.image_id, ami.name, ami.creation_date].join(": ")
  end
end
