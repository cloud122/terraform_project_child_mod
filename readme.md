### To set the secrets:

```
aws secretsmanager put-secret-value \
    --secret-id "core/jenkins/automation" \
    --secret-string file://mycreds.json
```
### Contents of mycreds.json:
```
{
    "username": "user1",
    "password": "pass1",
    "token": "token1",
    "secret": "secret1"
}
```