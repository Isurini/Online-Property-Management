<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Property Feed</title>
  <!-- Header Style sheet -->
    <link rel="stylesheet" type="text/css" href="css/header.css">
  <!-- Footer Style sheet -->
    <link rel="stylesheet" type="text/css" href="css/footer.css">
 
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 20px;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
    }

    .feed {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
      gap: 20px;
    }

    .property-card {
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      cursor: pointer;
      transition: transform 0.2s;
    }

    .property-card:hover {
      transform: scale(1.02);
    }

    .property-card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }

    .property-content {
      padding: 15px;
    }

    .property-price {
      font-size: 1.2em;
      font-weight: bold;
      color: #2c3e50;
    }

    .property-address {
      font-size: 1em;
      color: #555;
      margin: 5px 0;
    }

    .property-description {
      font-size: 0.9em;
      color: #777;
    }

    /* Modal styles */
    .modal {
      display: none;
      position: fixed;
      z-index: 1000;
      top: 0; left: 0;
      width: 100%; height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      justify-content: center;
      align-items: center;
    }

    .modal-content {
      background: white;
      border-radius: 8px;
      max-width: 600px;
      width: 90%;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
      animation: fadeIn 0.3s ease-in-out;
    }

    .modal-content img {
      width: 100%;
      height: auto;
      display: block;
    }

    .modal-body {
      padding: 15px;
    }

    .modal-close {
      float: right;
      font-size: 1.5em;
      margin: 10px;
      cursor: pointer;
      color: #333;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: scale(0.95); }
      to { opacity: 1; transform: scale(1); }
    }
  </style>
</head>
<!-- Header Include -->
<jsp:include page="Header.jsp" />
<body>
 
  <h1>Houses</h1>

  <div class="feed">
    <!-- Property Card 1 -->
  <div class="property-card" onclick="openModal('Images/house1.jpeg', 'LKR 10,500,000', 'Kandy road, Kurunegala', '3 bed   2 bath   1,500 sqft')">
  <img src="Images/house1.jpeg" alt="Property Image 1" />
  <div class="property-content">
    <div class="property-price">LKR 18,500,000</div>
    <div class="property-address">Thalawathugoda</div>
    <div class="property-description">
      5 bed   4 bath 
      <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button>

    </div>
  </div>
</div>


    <!-- Property Card 2 -->
    <div class="property-card" onclick="openModal('Images/house2.jpeg', 'LKR 850,000', 'Colombo road, Nittambuwa', '4 bed   3 bath   2,300 sqft')">
      <img src="Images/house2.jpeg" alt="Property Image 2" />
      <div class="property-content">
        <div class="property-price">LKR 27,500,000</div>
        <div class="property-address">Bolgoda</div>
        <div class="property-description">4 bed   3 bath
        <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button>
     </div>
      </div>
    </div>

    <!-- Property Card 3 -->
    <div class="property-card" onclick="openModal('Images/house3.jpeg', 'LKR 950,000', 'Weliwita road, Malabe', '4 bed   3 bath   2,300 sqft')">
      <img src="Images/house3.jpeg" alt="Property Image 3" />
      <div class="property-content">
        <div class="property-price">LKR 9,500,000</div>
        <div class="property-address">Malabe</div>
        <div class="property-description">4 bed   3 bath
        <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button>
        </div>
      </div>
    </div>

    <!-- Property Card 4 -->
    <div class="property-card" onclick="openModal('Images/house4.jpeg', 'LKR 1,550,000', 'Park road, Borella', '4 bed   3 bath   2,300 sqft')">
      <img src="Images/house4.jpeg" alt="Property Image 4" />
      <div class="property-content">
        <div class="property-price">LKR 19,000,000</div>
        <div class="property-address">Borella</div>
        <div class="property-description">4 bed   3 bath
        <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button></div>
      </div>
    </div>

    <!-- Property Card 5 -->
    <div class="property-card" onclick="openModal('Images/house5.jpeg', 'LKR 1,550,000', 'Park road, Borella', '4 bed   3 bath   2,300 sqft')">
      <img src="Images/house5.jpeg" alt="Property Image 5" />
      <div class="property-content">
        <div class="property-price">LKR 1,050,000</div>
        <div class="property-address">Nugegoda</div>
        <div class="property-description">4 bed   3 bath 
        <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button></div>
      </div>
    </div>

    <!-- Property Card 6 -->
    <div class="property-card" onclick="openModal('Images/house6.jpeg', 'LKR 1,550,000', 'Park road, Borella', '4 bed   3 bath   2,300 sqft')">
      <img src="Images/house6.jpeg" alt="Property Image 6" />
      <div class="property-content">
        <div class="property-price">LKR 1,550,000</div>
        <div class="property-address">Park road, Borella</div>
        <div class="property-description">4 bed   3 bath 
        <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button></div>
      </div>
    </div>

    <!-- Property Card 7 -->
    <div class="property-card" onclick="openModal('Images/house7.jpeg', 'LKR 1,550,000', 'Park road, Borella', '4 bed   3 bath   2,300 sqft')">
      <img src="Images/house7.jpeg" alt="Property Image 7" />
      <div class="property-content">
        <div class="property-price">LKR 1,550,000</div>
        <div class="property-address">Kadawatha</div>
        <div class="property-description">4 bed   2 bath
        <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button> </div>
      </div>
    </div>

    <!-- Property Card 8 -->
    <div class="property-card" onclick="openModal('Images/house8.jpeg', 'LKR 1,550,000', 'Park road, Borella', '4 bed   3 bath   2,300 sqft')">
      <img src="Images/house8.jpeg" alt="Property Image 8" />
      <div class="property-content">
        <div class="property-price">LKR 2,570,000</div>
        <div class="property-address">Baththaramulla</div>
        <div class="property-description">4 bed   3 bath
        <br />
      <button 
      onclick="event.stopPropagation(); window.location.href='inquire.jsp';" 
      style="margin-top: 10px; padding: 8px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
      Inquiry
     </button></div>
      </div>
    </div>
  </div>

  <!-- Modal -->
  <div id="propertyModal" class="modal" onclick="closeModal(event)">
    <div class="modal-content" onclick="event.stopPropagation()">
      <span class="modal-close" onclick="closeModal(event)">&times;</span>
      <img id="modalImg" src="" alt="Property Image" />
      <div class="modal-body">
        <div id="modalPrice" class="property-price"></div>
        <div id="modalAddress" class="property-address"></div>
        <div id="modalDesc" class="property-description"></div>
      </div>
    </div>
  </div>

  <!-- JavaScript -->
  <script>
    function openModal(img, price, address, description) {
      document.getElementById('modalImg').src = img;
      document.getElementById('modalPrice').textContent = price;
      document.getElementById('modalAddress').textContent = address;
      document.getElementById('modalDesc').textContent = description;
      document.getElementById('propertyModal').style.display = 'flex';
    }

    function closeModal(event) {
      document.getElementById('propertyModal').style.display = 'none';
    }
  </script>
<!-- Footer Include -->
<jsp:include page="Footer.jsp" />
</body>
</html>
