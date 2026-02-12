terraform { 
  cloud { 
    
    organization = "RootLab" 

    workspaces { 
      name = "Zero-Scaling-Fargate-Scaling-Serverless-CI-CD-Pipeline" 
    } 
  } 
}