# Week 1 — App Containerization
## Completed tasks:
* Created budget
* Created alarm

## Commands:

* Save account id in a shell env variable:

`export ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)`

---

* Print variable:

`env | grep ACCOUNT_ID`

---

* AWS CLI command that creates a new budget in your AWS account using the AWS Budgets service:
* Run this command from folder 'aws-bootcamp-cruddur' :

`budgets create-budget \
  --account-id $ACCOUNT_ID \
  --budget file://aws/json/budget.json \
  --notifications-with-subscribers file://aws/json/budget-notifications-with-subscribers.json`
`