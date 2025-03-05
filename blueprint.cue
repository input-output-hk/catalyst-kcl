version: "1.0"
global: {
	ci: {
		local: [
			"^check(-.*)?$",
			"^build(-.*)?$",
			"^package(-.*)?$",
			"^test(-.*)?$",
		]
		providers: {
			aws: {
				region: "eu-central-1"
				role:   "arn:aws:iam::332405224602:role/ci"
			}

			docker: credentials: {
				provider: "aws"
				path:     "global/ci/docker"
			}

			earthly: {
				credentials: {
					provider: "aws"
					path:     "global/ci/earthly"
				}
				org:       "Catalyst"
				satellite: "ci"
				version:   "0.8.15"
			}

			github: {
				registry: "ghcr.io"
			}

			kcl: {
				install: true
				registries: [
					"ghcr.io/input-output-hk/catalyst-kcl",
				]
				version: "v0.11.0"
			}
		}
	}
	repo: {
		defaultBranch: "master"
		name:          "input-output-hk/catalyst-kcl"
	}
}
