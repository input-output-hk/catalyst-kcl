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
				ecr: registry: "332405224602.dkr.ecr.eu-central-1.amazonaws.com"
				role: "arn:aws:iam::332405224602:role/ci"
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

			kcl: {
				install: true
				registries: [
					aws.ecr.registry,
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
