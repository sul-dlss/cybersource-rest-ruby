require 'json'
require 'test/unit'

json_data = File.read("roads.json")
hash_roads = JSON.parse(json_data)

def find(hash_response,key)
	key_split = key.split(".")
	for split in key_split
		hash_response = hash_response[split]
	end
	return hash_response
end

TestData = Struct.new :name , :data
AssertionData = Struct.new :expected, :actual

TEST_DATA = []	

for road in hash_roads["roads"]
	# get the fully qualified file name
	class_qualified_name = road["sampleClassName"]["node"].gsub('.','/')
	file_name = "Samples/" + class_qualified_name + ".rb"

	# load the file
	require_relative file_name

	# Get the class name from file
	class_name = class_qualified_name.split("/").last				

	# Create an object instance of the class
	instance = Object.const_get(class_name).new

	# Call the function
	response, http_status = instance.main(false)

	# Convert the Json response to hash
	hash_response = JSON.parse(response)
	
	data = []	
	
	data.push(AssertionData.new(road["assertions"]["httpStatus"], http_status.to_s))
	for required_field in road["assertions"]["requiredFields"]
		data.push(AssertionData.new(hash_response.has_key?(required_field),true))
	end
	for expected_value in road["assertions"]["expectedValues"]
		actual_value = find(hash_response,expected_value["field"])
		data.push(AssertionData.new(expected_value["value"], actual_value))
	end
	TEST_DATA.push(TestData.new('test_' + class_name.downcase, data))	
	print("\n")	
end

# Start Validations			
Class.new Test::Unit::TestCase do
	TEST_DATA.each do |test|
		define_method(test.name) do
			test.data.each do |i|
				assert_equal(i.expected,i.actual)
			end
		end
	end
end



