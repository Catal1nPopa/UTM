#ex 1
import os
import re
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
url = 'https://ro.wikipedia.org/wiki/Republica_Moldova'
response = requests.get(url)

soup = BeautifulSoup(response.content, 'html.parser')
title = soup.title.string
print(f"Titlu paginii: {title}")

titluri_sectiuni = soup.find_all(re.compile('^h[1-6]'))
print("Titlu sectiunilor : ")
for header in titluri_sectiuni:
    print(header.text)


desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
save_path = os.path.join(desktop_path, 'imagini')
if not os.path.exists(save_path):
    os.makedirs(save_path)

# Parcurgem toate tag-urile de imagine din pagina web
downloaded_images = 0
for item in soup.find_all('img'):
    if downloaded_images >= 30:
        break

    # Obținem URL-ul imaginii
    img_url = urljoin(url, item['src'])

    try:
        # Descarcă imaginea
        img_data = requests.get(img_url).content

        # Obține numele fișierului din URL-ul imaginii
        img_name = os.path.join(save_path, os.path.basename(img_url))

        # Salvează imaginea în directorul creat
        with open(img_name, 'wb') as img_file:
            img_file.write(img_data)

        print(f'Imagine descărcată și salvată: {img_name}')
        downloaded_images += 1

    except Exception as e:
        print(f'Eroare la descărcarea imaginii de la {img_url}: {e}')



#ex2
import requests
from bs4 import BeautifulSoup

def carti_2_stele(url):
    titles = []

    while url:
        # Accesam pagina web
        response = requests.get(url)
        soup = BeautifulSoup(response.text, 'html.parser')

        # Obținem titlurile cărților cu evaluare de 2 stele
        for book in soup.find_all('article', class_='product_pod'):
            rating = book.find('p', class_='star-rating')['class'][1]
            if rating == 'Two':
                title = book.h3.a['title']
                titles.append(title)

        # Găsim următoarea pagină
        next_page = soup.find('li', class_='next')
        if next_page:
            url = url.rsplit('/', 1)[0] + '/' + next_page.a['href']
        else:
            url = None

    return titles

url = 'http://books.toscrape.com/index.html'
result = carti_2_stele(url)
for title in result:
    print(title)

#3

##interauto
import requests
from bs4 import BeautifulSoup
from csv import writer

url = "https://interauto.md/vehicle/toyota-c-hr-a63880/"
page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')
results = soup.find_all('div', class_='rounded shadow bg-dark position-relative single_car__specifications')
#print(results)
with open('interauto.csv', 'w', newline='', encoding='utf8') as f:
    thewriter = writer(f)
    header = ['Denumire', 'Caracteristici']
    thewriter.writerow(header)

    for result in results:
        #title = result.find('h2').text
        #an = result.find('div', class_ = 'row').h4.text.strip()
        #parcurs = result.find('div', class_='col-6 col-md-4 item').h4.text.strip()
        # Presupunând că 'result' este obiectul BeautifulSoup care conține HTML-ul
        divs = result.find_all('div', class_='col-6 col-md-4 item')
        for div in divs:
            h4_text = div.h4.text.strip()
            h6_text = div.h6.text.strip()
            print(h4_text)
            print(h6_text)
            jobinfo = [h6_text, h4_text]
            thewriter.writerow(jobinfo)

##999
import requests
from bs4 import BeautifulSoup
from csv import writer
url = "https://999.md/ro/84692431"
page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')
results = soup.find_all('div', class_='adPage__content__features__col grid_7 suffix_1')

with open('999.csv', 'w', newline='', encoding='utf8') as f:
    thewriter = writer(f)
    header = ['Denumire', 'Caracteristici']
    thewriter.writerow(header)

    for result in results:
        uls = result.find_all('ul')
        for div in uls:
            key_spans = div.find_all('span', class_='adPage__content__features__key')
            value_spans = div.find_all('span', class_='adPage__content__features__value')

            key_texts = [span.text.strip() for span in key_spans]
            value_texts = [span.text.strip() for span in value_spans]

            for key, value in zip(key_texts, value_texts):
                jobinfo = [key, value]
                thewriter.writerow(jobinfo)
####expert
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


##cURS1
import requests
from bs4 import BeautifulSoup
import csv

url = "https://www.investing.com/currencies/eur-usd-historical-data"
page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

# Find the table containing the historical data
table = soup.find('table', class_='datatable_table__DE_1_ datatable_table--border__XOKr2 datatable_table--mobile-basic__rzXxT datatable_table--freeze-column__XKTDf')
print(table)
# Check if the table is found
if table:
    # Open a CSV file for writing
    with open('historical_data.csv', 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)

        # Write header to the CSV file
        csv_writer.writerow(['Time', 'Price'])

        # Find all rows in the table
        rows = table.find_all('tr')

        # Iterate over rows
        for row in rows[1:]:  # Skip the header row
            # Find all columns in the row
            columns = row.find_all('td')

            # Extract time and price data
            time = columns[0].text.strip()
            price = columns[1].text.strip()

            # Print or save the data
            print(f'Time: {time}, Price: {price}')

            # Write the data to the CSV file
            csv_writer.writerow([time, price])
else:
    print("Table not found on the page.")


###curs 2
import requests
from bs4 import BeautifulSoup
import csv
from datetime import datetime

url = "https://www.exchangerates.org.uk/EUR-USD-exchange-rate-history.html"
page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

# Find the table containing the historical data
table = soup.find('table')

# Check if the table is found
if table:
    # Open a CSV file for writing
    with open('historical_data.csv', 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)

        # Write header to the CSV file
        csv_writer.writerow(['Time', 'Price'])

        # Find all rows in the table
        rows = table.find_all('tr', class_='colone')

        # Iterate over rows
        for row in rows[1:]:  # Skip the header row
            # Find all columns in the row
            columns = row.find_all('td')

            # Extract time and price data
            raw_time = columns[0].text.strip()
            time = datetime.strptime(raw_time, '%A %d %B %Y').strftime('%d/%m/%Y')

            # Extract only the numerical value from the '1 EUR = 1.0887 USD' format
            raw_price = columns[1].text.strip()
            price = raw_price.split('=')[1].strip().split()[0]

            # Print or save the data
            print(f'Time: {time}, Price: {price}')

            # Write the data to the CSV file
            csv_writer.writerow([time, price])
else:
    print("Table not found on the page.")


##curs 3
import requests
from bs4 import BeautifulSoup
import csv

url = "https://www.exchange-rates.org/exchange-rate-history/eur-usd"
page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

# Find the table containing the historical data
table = soup.find('table', class_='history-rates-data')

# Check if the table is found
if table:
    # Open a CSV file for writing
    with open('historical_data.csv', 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)

        # Write header to the CSV file
        csv_writer.writerow(['Date', 'Value'])

        # Find all rows in the table
        rows = table.find_all('tr')

        # Iterate over rows
        for row in rows[1:]:  # Skip the header row
            # Find all columns in the row
            columns = row.find_all('td')

            # Extract date and value data if there are enough columns
            if len(columns) >= 2:
                date = columns[0].find('a', class_='n').text.strip()
                value1 = columns[1].find('span', class_='n').text.strip()
                value = value1.split('=')[1].strip().split()[0]
                # Print or save the data
                print(f'Date: {date}, Value: {value}')

                # Write the data to the CSV file
                csv_writer.writerow([date, value])
else:
    print("Table not found on the page.")
