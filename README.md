# NYU Libraries GeoBlacklight Metadata Repository

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/nyu-dataservices/gis-metadata-staging/lint.yml?style=for-the-badge&label=nyu%20staging%20records&link=https%3A%2F%2Fgithub.com%2FNYU-DataServices%2Fgis-metadata-staging%2Factions%2Fworkflows%2Flint.yml) &nbsp;
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/opengeometadata/edu.nyu/lint.yml?style=for-the-badge&label=ogm%20prod%20records&link=https%3A%2F%2Fgithub.com%2Fopengeometadata%2Fedu.nyu%2Factions%2Fworkflows%2Flint.yml)


[OpenGeoMetadata/edu.nyu](https://github.com/OpenGeoMetadata/edu.nyu) is the cannonical, most current source for geospatial metadata housed within the NYU Libraries collection in our [Spatial Data Repository](https://geo.nyu.edu). 

👀 You might currently be looking at [OpenGeoMetadata/edu.nyu](https://github.com/OpenGeoMetadata/edu.nyu) or at NYU's internal fork [NYU-DataServices/gis-metadata-staging](https://github.com/NYU-DataServices/gis-metadata-staging) — the latter is where NYU staff works on in-process records to lint and stage in our staging instance.

## Contributing

> *Note: [OpenGeoMetadata/edu.nyu](https://github.com/OpenGeoMetadata/edu.nyu) should not committed to directly—it should receive pull requests from [NYU-DataServices/gis-metadata-staging](https://github.com/NYU-DataServices/gis-metadata-staging) to ensure parity.*

<br><br>

*** *TO DO * ** Add diagram here*

<br><br>

1. You can add records to [NYU-DataServices/gis-metadata-staging](https://github.com/NYU-DataServices/gis-metadata-staging) in a new branch (e.g., `lidar-collection-2023`) from your local machine or directly in the GitHub GUI. Just make sure the records are in the correct place for their schema, e.g., `metadata-1.0` or `metadata-aardvark`. *(Note: Only aardvark records will get indexed to the NYU Spatial Data Repository as of Fall 2023.)*
2. When you're ready, make a pull request from your branch to `main`—this will trigger linting for the records in GitHub Actions. (See badges above)
3. *** *TO DO * ** After the linters & PR pass, merging into `main` will trigger indexing of the aardvark records found in the `main` branch of [NYU-DataServices/gis-metadata-staging](https://github.com/NYU-DataServices/gis-metadata-staging) to NYU's [staging instance of the SDR](https://geo-stage.library.nyu.edu/) for QA testing.* *(Must be on NYU VPN to view the staging instance)*
4. After QA on staging, a PR can be submitted from [NYU-DataServices/gis-metadata-staging](https://github.com/NYU-DataServices/gis-metadata-staging) over to the cannoinical repo [OpenGeoMetadata/edu.nyu](https://github.com/OpenGeoMetadata/edu.nyu). Any records pulled into this cannonical OpenGeoMetadata repo will get indexed to our production instance (and other institutions'!)

## Local development

Follow the steps below to run linting and other tasks locally.

### Prerequisites 
- Git
- Ruby (via RVM, Chruby, or Rbenv)
  
### Steps
1. Clone the repository
    ```
    gh repo clone NYU-DataServices/gis-metadata-staging & cd gis-metadata-staging
    ```
2. Install ruby dependencies
    ```
    bundle install
    ```
3. Run linting on one or both groups of records
   ```
   bundle exec rake lint:v1
   bundle exec rake lint:aardvark
   bundle exec rake lint:all
   ```
4. If the aarvark linters fail, you might try to run and/or update the script in `/misc`:
   ```
   bundle exec ruby misc/aardvark-schema-patching.rb
   ```







