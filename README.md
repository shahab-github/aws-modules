### simple aws modules

###### Usage

```
module "mod-sg" {
  source = "github.com/shahab-github/aws-modules/ec2"
}
```

```
module "mod-vpc" {
  source = "github.com/shahab-github/aws-modules/vpc"
}
```

```
module "mod-sg" {
  source = "github.com/shahab-github/aws-modules//security-groups?ref=devtest"
}
```