//this is the basic structure of how you can create provider//
//define a provider : is actually provides us set of code so that communication could be possible with API  //
provider "aws" {
  region  = "ap-south-1"
  access_key = "X"
   secret_key = "X"
 }

//This is the first instance initialization block//

resource "aws_instance" "my-first-serve" {
  ami           = "ami-0c1a7f89451184c8b" # us-west-2
  
 instance_type = "t2.micro"

# //Adding change into the instance property and you can see ait after terraform plan command \\

tags = {
     Name = "Windows_Server2021"
   }
   }

# //Second instance's block//

#   resource "aws_instance" "my-first-server1" {
#    ami           = "ami-04db49c0fb2215364" # us-west-2
#   instance_type = "t2.micro"

# //Adding second  change in instance and you can see it after terraform plan command \\

#  tags = {
#     Name = "Windows_Server1"
#   }

# }

# //Third instance and its block code // ami-0a2c5db28eae610c5//

# resource "aws_instance" "my-first-server3" {
#    ami           = "ami-06a0a2a8985a07388" # us-west-2
#   instance_type = "t2.micro"

# //Adding second  change in instance and you can see it after terraform plan command \\

#  tags = {
#     Name = "Windows_Server3"
#   }

# }
 

# //Creating fourth instance and its block code // ami-0a2c5db28eae610c5//


# resource "aws_instance" "my-first-server4" {
#    ami           = "ami-0c1a7f89451184c8b" # us-west-2
#   instance_type = "t2.micro"

# //Adding second  change in instance and you can see it after terraform plan command \\

#  tags = {
#     Name = "Ubuntu_Server4"
#   }

# }

//Order doesnt matter in the terraform so i have pasted below code hare to prove you //
//after running that in this order you can see that the previous output and current output is same so that it means that terraform is enough intelligent to identifying instances and its process//

# resource "aws_subnet" "subnet-1" {
#   vpc_id     = aws_vpc.my-first_vpc.id //It is the step where you are giving an property to resource to come under VPC//
#    cidr_block = "10.0.1.0/24"

#    tags = {
#      Name = "prod-subnet"
#    }
#  }

# //How to create VPC virtual provate cloud Network configuration on which cluster could be run//
# //You can add alot od VPcs in your infrastructure //

#  resource "aws_vpc" "my-first_vpc" {
#    cidr_block = "10.0.0.0/16"

#    tags = {
#     Name = "production meeting"
#   }
#  }

# //To showing about how state file gets changed//

#  resource "aws_vpc" "my-second_vpc" {
#    cidr_block = "10.1.0.0/16"

#    tags = {
#     Name = "dev"
#   }
#  }

#  resource "aws_subnet" "subnet-2" {
#   vpc_id     = aws_vpc.my-second_vpc.id //It is the step where you are giving an property to resource to come under VPC//
#    cidr_block = "10.1.1.0/24"

#    tags = {
#      Name = "dev-subnet"
#    }
#  }

# //Now have to build an subnating of the VPC //

#  resource "aws_subnet" "subnet-1" {
#   vpc_id     = aws_vpc.my-first_vpc.id //It is the step where you are giving an property to resource to come under VPC//
#    cidr_block = "10.0.1.0/24"

#    tags = {
#      Name = "prod-subnet"
#    }
#  }

 //Lets create project on it //
 //Tasks//

#   # 1.create vpn

#   resource "aws_vpc" "prod-vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags={
#     name="production"
#     }
#   }

#   # 2.create internet gateway

#   resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.prod-vpc.id

# }


#   # 3.create custom route table

#   resource "aws_route_table" "prod-route_table" {
#   vpc_id = aws_vpc.prod-vpc.id

#   route = [
#     {
#       cidr_block = "0.0.0.0/0" #10.0.1.0/24 is the for particular network but 0.0.0.0/0 would allows any network//
#       gateway_id = aws_internet_gateway.gw.id 
#       carrier_gateway_id = null
#       destination_prefix_list_id = null
#       egress_only_gateway_id = null 
#       instance_id = null
#       ipv6_cidr_block = null
#       local_gateway_id = null
#       nat_gateway_id = null
#       network_interface_id = null
#       transit_gateway_id = null
#       vpc_endpoint_id = null
#       vpc_peering_connection_id = null
  


#     },
#     {
#       ipv6_cidr_block        = "::/0"
#       gateway_id = aws_internet_gateway.gw.id 
#       carrier_gateway_id = null
#       destination_prefix_list_id = null
#       egress_only_gateway_id = null 
#       instance_id = null
#       ipv6_cidr_block = null
#       local_gateway_id = null
#       nat_gateway_id = null
#       network_interface_id = null
#       transit_gateway_id = null
#       vpc_endpoint_id = null
#       vpc_peering_connection_id = null
#        cidr_block = null
#     }
#   ]

#   tags = {
#     Name = "prod"
#   }
# }

#   # 4.create a subnet 

#   resource "aws_subnet" "subnet-1" {
#     vpc_id = aws_vpc.prod-vpc.id
#     cidr_block = "10.0.1.0/24"
#     availability_zone = "ap-south-1a"

#     tags = {
#       Name = "prod-subnet"
#     }
#   }


#   # 5.Associate subnet with route table 

#     resource "aws_route_table_association" "a" {
#         subnet_id      = aws_subnet.subnet-1.id
#         route_table_id = aws_route_table.prod-route_table.id
# }


#   # 6.create security group to allow port 22,80,443

#   resource "aws_security_group" "allow_web" {
#   name        = "allow_web_traffic"
#   description = "Allow web inbound traffic"
#   vpc_id      = aws_vpc.prod-vpc.id

#   ingress = [
#     {
#       description      = "HTTPS"
#       from_port        = 443
#       to_port          = 443
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"] 
#       ipv6_cidr_blocks = null 
#        prefix_list_ids = null , security_groups = null , self = null 
#     } , 

  
  

#     {
#       description      = "HTTP"
#       from_port        = 80
#       to_port          = 80
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"] 
#       ipv6_cidr_blocks = null  
#       prefix_list_ids = null, security_groups = null , self = null
#     } ,

  

 
#     {
#       description      = "SSH"
#       from_port        = 2
#       to_port          = 2
#       protocol         = "tcp"
#       cidr_blocks      = ["0.0.0.0/0"]  
#        ipv6_cidr_blocks = null 
#         prefix_list_ids = null, security_groups = null , self = null
#     } 

#   ]
  

  

# //ALLOWING ALL PORTS TO EGRESS DIRECTION//

#   egress = [
#     {
#       from_port        = 0
#       to_port          = 0
#       protocol         = "-1"      
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#        prefix_list_ids = null, security_groups = null , self = null
#        description = null 
#     }
#   ]

#   tags = {
#     Name = "allow_web"
#   }
# }


#   # 7.create a netwrok interface with an ip in the subnet was created in step 4

#   resource "aws_network_interface" "web-server-nic" {
#   subnet_id       = aws_subnet.subnet-1.id
#   private_ips     = ["10.0.1.50"]
#   security_groups = [aws_security_group.allow_web.id]
# }

#   # 8.Assign a elastic ip to the network interface created in step 7

#   resource "aws_eip" "one" {
#   vpc                       = true
#   network_interface         =aws_network_interface.web-server-nic.id
#   associate_with_private_ip = "10.0.0.50"
#   depends_on = [aws_internet_gateway.gw]  ///Here we are reffering whole object not id/
# }

#   # 9.Create ubuntu server and install/enable apache2

#   resource "aws_instance" "web-server-instance" {
#     ami = "ami-04bde106886a53080"
#     instance_type = "t2.micro"
#     availability_zone = "ap-south-1a"
#     key_name = "main-key"

#     network_interface {
#       device_index = 0 
#       network_interface_id = aws_network_interface.web-server-nic.id
#     }

#     user_data = <<-EOF
#                    #!/bin/bash
#                    sudo apt update -y
#                    sudo apt install apache2 -y
#                    sudo systemctl start apache2
#                    sudo bash -c 'echo your very first web server > /var/www/html/index.html'
#                    EOF

#     tags = {
#       Name = "web-server"
#     }



#   }
  

  //Prior to go with the process we have to create an key pair that would allows us to connect with all devices//




 

#resource "aws_"
#resources "<provider>_<resource_type>" "name"{
    #config options.....
    #key - "value"
    #key2 = "another value"
#}
