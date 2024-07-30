import csv
import json
import sys

def csv_to_ngsild(csv_file, json_file):
    entities = []
    
    with open(csv_file, 'r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        
        for row in reader:
            entity = {
                "id": row['id'],
                "type": row['type'],
                "title": {
                    "type": "Property",
                    "value": row['title']
                },
                "image": {
                    "type": "Property",
                    "value": row['image'] if row['image'] else None
                },
                "relevance": {
                    "type": "Property",
                    "value": int(row['relevance']) if row['relevance'] else None
                },
                "location": {
                    "type": "GeoProperty",
                    "value": {
                        "type": row['location_type'],
                        "coordinates": list(map(float, row['coordinates'].split(',')))
                    }
                },
                "price": {
                    "type": "Property",
                    "value": row['price']
                },
                "occupancy": {
                    "type": "Property",
                    "value": row['occupancy']
                },
                "description": {
                    "type": "Property",
                    "value": row['description']
                }
            }

            # Remove the relevance field if it is None
            if entity["relevance"]["value"] is None:
                del entity["relevance"]

            # Remove the image field if it is None
            if entity["image"]["value"] is None:
                del entity["image"]
                
            entities.append(entity)
    
    with open(json_file, 'w', encoding='utf-8') as jsonfile:
        json.dump(entities, jsonfile, ensure_ascii=False, indent=2)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <input_csv_file> <output_json_file>")
        sys.exit(1)

    csv_file = sys.argv[1]
    json_file = sys.argv[2]
    
    csv_to_ngsild(csv_file, json_file)
