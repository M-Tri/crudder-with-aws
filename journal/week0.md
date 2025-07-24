# Week 0 — Billing and Architecture
### Completed tasks:
* Created user account
* Set up AWS CLI, IAM, policy, roles...
* Created budget
* Created alarm

### Project chart

![Cart](./images/aws_project_chart.svg)

## Commands:

* Save account id in a shell env variable:

```bash
export ACCOUNT_ID=accountID
```

* Print variable:

```bash
env | grep ACCOUNT_ID
```

* AWS CLI command that creates a new budget in your AWS account using the AWS Budgets service:
  * Run this command from folder 'aws-bootcamp-cruddur' :

  `budgets create-budget \
    --account-id $ACCOUNT_ID \
    --budget file://aws/json/budget.json \
    --notifications-with-subscribers file://aws/json/budget-notifications-with-subscribers.json`
  `
---

### Important concepts:
* Access Key lets you access all AWS services your permissions allow.
* API Key lets you access only one specific AWS service.
* BFG Repo-Cleaner ,git filter-repo ,trufflehog (finds verified vs unverified keys; Active vs not-active keys) ...
* WARNING: Avoid using `git reset --hard origin/main`
  * This command will permanently discard **all** local changes.
  * If you must use it, make sure to **back up** your work first.
  * Only use this as a last resort — it's rarely the right solution.