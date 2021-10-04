import os
import json

def parse():
    result = []

    try:
        with open(os.getcwd() + '/baro.json', 'r', encoding='utf-8') as f:
            json_data = json.load(f)

        for i in json_data['body']['items']:
            result.append({
                "name": i['bizesNm'],
                "sub_name": i['brchNm'],
                "address": i['rdnm'],
                "lat": i['lat'],
                "lon": i['lon'],
            })

        with open(os.getcwd() + '/cafe.json', 'w', encoding='utf-8') as f:
            f.write(json.dumps(result, indent=4, ensure_ascii=False))
        
    
    except FileNotFoundError:
        print('no file')

if __name__ == "__main__":
    parse()