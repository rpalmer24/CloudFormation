# cloudformation
## Bastion Host-CloudFormation Project

In this project, I created a secure and highly available  infrastructure using AWS CloudFormation.

#### Frist Step
- Designed VPC (vpc.yaml)
- Created Public Sunbnets (2) using AWS EC2
- Created Private subnets (2) for  using AWS EC2
- Two availability zones

This is what the code produced in the AWS console

<img width="566" alt="Resource map" src="https://github.com/user-attachments/assets/778c2dab-0e5d-4684-a692-3f51ad27ce29">

#### Step Two 
-Created a Routing Table, Internet Gateway, and Public Route to connect to a private subnet
-Attached an Internet Gateway to the VPC
-Created the route table allowing communication between the internet and the public subnet
<img width="736" alt="Resource map with public route" src="https://github.com/user-attachments/assets/1d233ba3-d3ac-4954-b8a5-5e53c1e2a5e7">

##### Step Three
-Deployed a Bastion Host in the Public Subnet 1A and connected it to the internet gateway 
-Created security groups  to ensure secure access to private resources
-For secure communication with servers configured SSH key pairs for authentication 

Validated my code by successfully accessing the bastion host from my local machine

<img width="592" alt="Bastion Host on local machine" src="https://github.com/user-attachments/assets/86b3b83f-fc2d-4ec6-bba8-e3547d7eb3d7">

#### Last Step: Create IAM User, ALB, S3, RDS

**Application Load Balancer** (ec2.yaml)
Created an Application Load Balancer to direct traffic to two targets/EC2 instances, 
specifically PublicSubnet1A and PublicSubnet2B. A listener was configured to check for incoming requests and handle them based on predefined rules. 
In this case, it is set to listen for HTTP traffic on port 80, and when a request is received, it is forwarded to the target group. 
The ALB distributes any traffic that reaches the target group accordingly.

<img width="764" alt="ALB" src="https://github.com/user-attachments/assets/83ddfabe-550b-4aab-83a4-fbd45fc504ac">

**Auto-Scaling** and **Cloudwatch
Added Auto Scaling and CloudWatch Alarms to monitor the group

- Created a launch configuration to define instance settings. The auto-scaling group was set with a minimum of 1 instance, a maximum of 3, and a desired capacity of 2.
- Configured the alarm to trigger if CPU utilization exceeds 70%. It averages data points over a 300-second (5-minute) period and requires only one data point to activate.

<img width="698" alt="ASG" src="https://github.com/user-attachments/assets/d16c8da5-6546-42f4-a09c-4e9c7b625c23">

<img width="760" alt="CPU" src="https://github.com/user-attachments/assets/e1c21726-39ae-4cf7-a906-e3996e1fe45f">

