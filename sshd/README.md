# TL;DR

An sshd work container that allows a user to login as a `gen3` user, and work with various tools.  Mostly intended for use with the [web tty](../wetty/).

## Use

The container is setup with sshd and a `gen3` user with `gen3` password.  Several useful development tools are installed.

```
docker run -d --rm --name sshd -p 2022:22 sshd:reuben
ssh -p 2020 gen3@localhost
```
