# User Management

## 2. User Management & Access Control

- Create user accounts for new developers (e.g., Sarah and Mike)
- Assign each user an isolated workspace directory
- Set directory permissions so only the owner can access
- Enforce password expiration and complexity

### Commands:

```bash

# Create users
sudo useradd -m -d /Sarah sarah
sudo useradd -m -d /mike mike
sudo passwd sarah
sudo passwd mike
```
![UserAdd_Passwd](https://github.com/user-attachments/assets/a9952529-4d98-46e7-8c09-70532a0d8567)
```bash

# Create and secure workspaces
sudo mkdir -p /Sarah/workspace /mike/workspace
sudo chown sarah:sarah /Sarah/workspace
sudo chown mike:mike /mike/workspace
sudo chmod 700 /Sarah/workspace /mike/workspace
```
![workspacefolder](https://github.com/user-attachments/assets/bb93b958-e1f2-43d1-98cd-70954e89e27b)
![Userfolder_1](https://github.com/user-attachments/assets/4b28723d-d719-47a3-9b78-15fb94773c50)


# Set password expiration
```bash

sudo chage -M 30 sarah
sudo chage -M 30 mike
```
![password_expiry](https://github.com/user-attachments/assets/d07ba3e0-f196-4a70-a366-1bdbc8d44dc2)

---

