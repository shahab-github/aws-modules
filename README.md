### simple aws modules

###### Usage

create ec2 instance using module
```
module "mod-sg" {
  source = "github.com/shahab-github/aws-modules/ec2"
}
```

create vpc using module
```
module "mod-vpc" {
  source = "github.com/shahab-github/aws-modules/vpc"
}
```

If want to refer to other branch
Below I am using code from **devtest** branch
```
module "mod-sg" {
  source = "github.com/shahab-github/aws-modules//security-groups?ref=devtest"
}
```