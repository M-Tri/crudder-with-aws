# Notes:

* This project is using a **CRA frontend + Flask backend** architecture.

---
## Shell/Environments Info:
### General :
- Three types : Login shell (~/.bash_profile), Interactive shell(~/.bashrc), script shell.
- A **child process** is any program or script that your current shell starts/runs. Your shell is the parent process. Example:
  - Running a command like node app.js from terminal. Terminal is parent, and new process 'app.js' is child.
  - Starting a script like ./myscript.sh. Terminal is parent, and new process './myscript.sh' is child.
  - **VAR=value** creates a variable only in the current shell session. Ex: Terminal is parent, and new process 'app.js' is child. VAR is only initialized in terminal.
  - **export VAR=value** is passed along the children processes. Ex: Terminal is parent, and new process 'vim text' is child. VAR is only initialized in both.
  - But once you close the terminal, that environment is destroyed — so the variable is gone in both cases.
  - To keep them in the terminal, You need to manually put **VAR=value** or **export VAR=value** in the (~/.bashrc) or (~/.bash_profile). But the same logic will apply. For example, if you set **VAR=value** in the (~/.bashrc) then it will be set in the interactive shell and child process will not inherit it.
- Using 'export' will pass env variables down in sub-shells but not in parallel shells.
- Interactive vs login: Opening new tab is usually login, then, opening a new terminal tab or window (usually non-login, interactive). This is to avoid re-running heavy environment 
setups every time you open a new shell tab.
- If you only set VAR=value or export VAR=value in ~/.bashrc, and then open a login shell, that variable may not be there — unless your login shell explicitly sources ~/.bashrc.

- By default, Bash does not automatically source ~/.bashrc in login shells. It only sources ~/.bash_profile (or ~/.profile, depending on the system). To ensure ~/.bashrc runs in all types of shells, you need to manually source it from your ~/.bash_profile. Example:

```bash 
if [ -f ~/.bashrc ]; then
source ~/.bashrc
fi 
```



### Summary
| Case                                                    | Variable Type            | Shell Type                                                   | Where Defined                            | Inherits to Child?                     | Persists Across Sessions?                     |
| ------------------------------------------------------- | ------------------------ | ------------------------------------------------------------ | ---------------------------------------- | -------------------------------------- | --------------------------------------------- |
| `VAR=value`                                             | **Local shell variable** | Login or Non-login                                           | Inline or in `.bashrc` / `.bash_profile` | ❌ No — only available in current shell | ❌ No — lost when shell exits                  |
| `export VAR=value`                                      | **Environment variable** | Login or Non-login                                           | Inline or in `.bashrc` / `.bash_profile` | ✅ Yes — available to child processes   | ❌ No — lost when shell exits                  |
| `VAR=value` in `~/.bashrc`                              | **Local shell variable** | **Non-login** (interactive shell, e.g. opening terminal tab) | `.bashrc`                                | ❌ No                                   | ✅ Yes — loaded each time `.bashrc` is sourced |
| `export VAR=value` in `~/.bashrc`                       | **Environment variable** | **Non-login**                                                | `.bashrc`                                | ✅ Yes                                  | ✅ Yes — reloaded each time terminal is opened |
| `export VAR=value` in `~/.bash_profile` or `~/.profile` | **Environment variable** | **Login shell only**                                         | `.bash_profile` / `.profile`             | ✅ Yes                                  | ✅ Yes — applies on login                      |
| `VAR=value` in `~/.bash_profile`                        | **Local shell variable** | Login                                                        | `.bash_profile`                          | ❌ No                                   | ✅ Yes — in shell, but not in child processes  |

#### Child Process and Environment Variables Examples:

* A **child process** is any program or script started by your current shell (the parent).

* Example 1:

  * You run `node app.js` in Terminal.
  * Terminal is the parent process, and the `node` process running `app.js` is the child process.

* Example 2:

  * You run `./myscript.sh`.
  * Terminal is parent, and `myscript.sh` runs as a child process.

* Example 4 : Variables without export:

  * `VAR=value` sets a shell variable **only in the current shell session** (parent).
  * It is **not passed** to child processes.

    ```bash
    VAR="hello"
    node -e 'console.log(process.env.VAR)'  # Prints undefined
    ```

* Example 5: Variables with export:

  * `export VAR=value` sets the variable and **marks it to be inherited by child processes**.
  * Child processes will see this variable in their environment.

    ```bash
    export VAR="hello"
    node -e 'console.log(process.env.VAR)'  # Prints "hello"
    ```

---

#### Interactive vs Login Shell Nuances:

* Opening a **new terminal tab or window** is usually an **interactive non-login shell** (reading `.bashrc`).
* The **login shell** runs only once at login and reads `.bash_profile`.
* This separation helps **avoid re-running heavy environment setups** (like `PATH` exports) on every new shell tab or window, improving speed.
* Often, `.bash_profile` sources `.bashrc` to combine the two behaviors and keep environment consistent.


---

## Steps:

* I am using **VSCode** instead of creating an environment with Gitpod.
* Create an **AWS USER account**.
* Install **AWS Command Line Interface (CLI)**.
* Install **42Crunch extension**.

---

## Command lines:

* `source ./aws-env.sh`
  Start by running the script in your current shell, sets environment variables for AWS CLI.
---

## Links:
* create-budget from AWS ALI Command Reference:
https://docs.aws.amazon.com/cli/latest/reference/budgets/create-budget.html#examples

---

## FREE AWS Cloud Project Bootcamp

* **Application:** Cruddur
* **Cohort:** 2023-A1

This is the starting codebase that will be used in the FREE AWS Cloud Project Bootcamp 2023.

---

![Cruddur Graphic](_docs/assets/cruddur-banner.jpg)

![Cruddur Screenshot](_docs/assets/cruddur-screenshot.png)

## Acknowledgments

*Credit and thanks to Cloud Instructor Andrew Brown from exampro.*
