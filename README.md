# gitpod-asdf

- Rename the Dockefile and put in `gitpod/.gitpod.dockerfile`
- Move your existing `.tool-versions` in `gitpod` and link `.tool-verisons` in your root to this
- Add this dockerfile to your `.gitpod.yml`

```yaml
image:
  file: gitpod/.gitpod.dockerfile
```

Note: If using postgres, you might need to add setup scripts.

- https://www.gitpod.io/docs/config-docker#configure-a-public-docker-image
