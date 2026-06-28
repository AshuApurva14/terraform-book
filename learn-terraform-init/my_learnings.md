## My mistakes and Learnings during practical handson

1. 

@AshuApurva14 ➜ /workspaces/terraform-book/learn-terraform-init (main) $ terraform plan
╷
│ Error: Incorrect attribute value type
│ 
│   on main.tf line 31, in resource "aws_instance" "webserver":
│   31:   ami = data.aws_ami.ubuntu
│     ├────────────────
│     │ data.aws_ami.ubuntu is object with 44 attributes
│ 
│ Inappropriate value for attribute "ami": string required, but have object.


╵