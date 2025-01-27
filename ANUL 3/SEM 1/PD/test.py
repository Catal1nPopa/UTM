import requests
from bs4 import BeautifulSoup
from csv import writer
url = "https://autoplaza.md/cars/171674/"
page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')
car_properties_div = soup.find('div', class_='car-proprieties')
print(car_properties_div)
with open('autoplaza.csv', 'w', newline='', encoding='utf8') as f:
    thewriter = writer(f)
    header = ['Denumire', 'Valoare']
    thewriter.writerow(header)

    # Iterează prin fiecare div cu clasa "car-prop" în cadrul div-ului "car-proprieties"
    for car_prop_div in car_properties_div.find_all('div', class_='car-prop'):
        # Extrage denumirea proprietății și valoarea corespunzătoare
        property_name = car_prop_div.find('span').get_text(strip=True)
        property_value = car_prop_div.find('strong') or car_prop_div.find('a')
        property_value = property_value.get_text(strip=True) if property_value else ""

        # Adaugă perechea de denumire și valoare în fișierul CSV
        jobinfo = [property_name, property_value]
        thewriter.writerow(jobinfo)