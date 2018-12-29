# Shepherd

- [Shepherd: Automating Cross-repo Code Changes](https://www.nerdwallet.com/blog/engineering/shepherd-automating-code-changes/)
- [NerdWalletOSS/shepherd GitHub repo](https://github.com/NerdWalletOSS/shepherd)

## Setup

- Follow the instructions [here](https://github.com/NerdWalletOSS/shepherd/blob/master/README.md#getting-started).
- Create a GitHub [personal access token](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/).

## Run a migration

Export your GitHub personal access token:
```sh
$ export GITHUB_TOKEN=yourtokenhere
```

Checkout the repos defined in the migrations file:
```sh
$ shepherd checkout migrations
```

Apply the migration:
```sh
$ shepherd apply migrations
```

Commit changes from the migration:
```sh
$ shepherd commit migrations
```

Push changes to the remote branch:
```sh
$ shepherd push migrations
```

Open pull requests:
```sh
$ shepherd pr migrations
```
