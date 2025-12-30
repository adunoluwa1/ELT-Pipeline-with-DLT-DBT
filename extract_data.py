from typing import Optional, Any
import dlt
# from dlt.common.typing import TDataItem, TDataItems
from dlt.sources.rest_api.typing import RESTAPIConfig
from dlt.sources.rest_api import (
    rest_api_resources,
    # rest_api_source,
    )
@dlt.source(name="media_content")
def json_placeholder(access_token:Optional[str]=dlt.secrets.value)->Any:
    config:RESTAPIConfig = {
        "client":{
            "base_url":"https://jsonplaceholder.typicode.com",
            "auth":(
                {
                    "type":"bearer",
                    "token": access_token
                } if access_token else None
            ),
            },
        "resource_defaults":{
            "primary_key":"id",
            "write_disposition":"merge",
            "endpoint":{
                "params":{
                    "per_page":100,
                },
            "paginator":"json_link"
            },
        },
        "resources": [
            "posts",
            "comments",
            "albums",
            "photos",
            "todos",
            "users",
        ]
    }
    yield from rest_api_resources(config)

def load_rest_api_data()->None:
    pipeline = dlt.pipeline(
        pipeline_name="media_content",
        destination="postgres",
        dataset_name="app_raw"
    )
    load_info = pipeline.run(json_placeholder())
    print(load_info)

if __name__ == "__main__":
    load_rest_api_data()
