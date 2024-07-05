Automating User and Group Management in Linux with Bash
As a SysOps engineer, one of my key responsibilities is to streamline and automate routine tasks. One such task is managing users and groups in a Linux environment.
Recently, our company onboarded several new developers, necessitating the creation of numerous user accounts and their corresponding group memberships.
To handle this efficiently, I developed a bash script that automates this process. In this article, I will walk you through the script, explaining each step and its
importance.

You can learn more about the HNG Internship program here and discover how to hire talented interns [Visit HNG Internship](https://hng.tech/internship). Also you can learn more about Linux commands [here](https://docs.kernel.org/)

Script Overview
The script, create_users.sh, reads a text file containing usernames and group names, where each line is formatted as user;groups. The script creates the users and groups
as specified, sets up home directories with appropriate permissions, generates random passwords for the users, and logs all actions to /var/log/user_management.log.
Additionally, the generated passwords are stored securely in /var/secure/user_passwords.txt.

## Usage

To use this script, run the following command:

```bash
bash create_users.sh <name-of-text-file>
```
