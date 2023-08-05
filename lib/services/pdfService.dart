import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../mobile.dart'; // Asegúrate de importar tu archivo mobile.dart correctamente aquí
import '../models/remision.dart';

class PDFService {
  Future<void> createPDF(Remision remision) async {
    try {
      final pdfDocument = PdfDocument();
      final page = pdfDocument.pages.add();
      Uint8List imageBytes;

      if (remision.empresa == 'SIDOC') {
        imageBytes =
            (await rootBundle.load('assets/verde.png')).buffer.asUint8List();
      } else {
        imageBytes =
            (await rootBundle.load('assets/azul.png')).buffer.asUint8List();
      }

      final PdfBitmap image = PdfBitmap(imageBytes);

      // Calcular las coordenadas para colocar la imagen en la esquina superior derecha.
      const double imageWidth = 400; // Ancho de la imagen
      const double imageHeight = 150; // Alto de la imagen
      const double xPosition = 0; // Pegar el logo a la esquina derecha
      const double yPosition1 = 0; // Pegar el logo a la esquina superior

      // Dibujar la imagen en la página del PDF.
      page.graphics.drawImage(image,
          const Rect.fromLTWH(xPosition, yPosition1, imageWidth, imageHeight));
      double yPosition = 170; // Posición inicial del contenido de la lista

// Definir las dimensiones y estilos del borde
      const double columnWidth = 200;
      const double columnHeight = 40;
      const double borderWidth = 1; // Grosor del borde

// Añadir el borde negro alrededor del cliente
      double x = 4;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth, columnHeight),
      );

// Añadir el texto del cliente dentro del borde
      page.graphics.drawString(
        'Cliente: ${remision.empresa}',
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor de la fecha de factura
      x += columnWidth;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth - 60, columnHeight),
      );

// Añadir el texto de la fecha de factura dentro del borde
      String text =
          'Fecha de factura: ${DateFormat('dd/MM/yyyy').format(remision.createdAt)}';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor del número de remisión
      x += columnWidth - 60;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, 170, columnHeight),
      );

// Añadir el número de remisión dentro del borde
      text = 'NO. ${remision.id}';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 21, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

      yPosition +=
          columnHeight; // Ajustar la posición para las siguientes secciones
      // Añadir texto a la página
      page.graphics.drawString(
          'NO. ${remision.id}',
          PdfStandardFont(PdfFontFamily.helvetica, 21,
              style: PdfFontStyle.bold),
          brush: PdfBrushes.black,
          bounds: const Rect.fromLTWH(350, 128, 300, 50));

      // yPosition += 20;

// Definir las dimensiones y estilos del borde para la segunda fila
      const double direccionWidth =
          400; // Ajustar el ancho de la columna de dirección
      const double ciudadWidth =
          100; // Ajustar el ancho de la columna de ciudad

// Reiniciar la posición x para la segunda fila
      x = 4;

// Añadir el borde negro alrededor de la dirección
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, direccionWidth, columnHeight),
      );

// Añadir el texto de la dirección dentro del borde
      page.graphics.drawString(
        'Dirección: ${remision.direccion}',
        PdfStandardFont(PdfFontFamily.helvetica, 15,
            style: PdfFontStyle
                .bold), // Puedes ajustar el tamaño y estilo del texto
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          direccionWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Mueve la posición x a la siguiente columna
      x += direccionWidth;

// Añadir el borde negro alrededor de la ciudad
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, ciudadWidth + 10, columnHeight),
      );
// Añadir el texto de la ciudad dentro del borde
      page.graphics.drawString(
        'Ciudad: ${remision.ciudad}',
        PdfStandardFont(PdfFontFamily.helvetica, 15,
            style: PdfFontStyle
                .bold), // Puedes ajustar el tamaño y estilo del texto
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          ciudadWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Ajustar la posición para las siguientes secciones
      yPosition += columnHeight;

// Añadir el borde negro alrededor del cliente
      x = 4;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth, columnHeight),
      );

// Añadir el texto del cliente dentro del borde
      page.graphics.drawString(
        'Transportador: ${remision.transportador}',
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor de la fecha de factura
      x += columnWidth;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth - 50, columnHeight),
      );

// Añadir el texto de la fecha de factura dentro del borde
      text = 'C.C: ${remision.ccTransportador}';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor del número de remisión
      x += columnWidth - 50;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, 160, columnHeight),
      );

// Añadir el número de remisión dentro del borde
      text = 'Placa ${remision.placa}';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

      yPosition +=
          columnHeight; // Ajustar la posición para las siguientes secciones
      yPosition += 20;

      x = 4;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth - 80, columnHeight),
      );

// Añadir el texto del cliente dentro del borde
      page.graphics.drawString(
        'REFERENCIA',
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor de la fecha de factura
      x += columnWidth - 80;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth - 80, columnHeight),
      );

// Añadir el texto de la fecha de factura dentro del borde
      text = 'CANTIDAD (KG)';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor del número de remisión
      x += columnWidth - 80;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, 270, columnHeight),
      );

// Añadir el número de remisión dentro del borde
      text = 'DESCRIPCION DEL ARTICULO';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

      yPosition +=
          columnHeight; // Ajustar la posición para las siguientes secciones

// Definir las dimensiones y estilos del borde para la nueva fila

      const double descriptionWidth = 270;
      double materialWidth = 120;
      double cantidadWidth = 120;
// Añadir los productos de la remisión
      for (final articulo in remision.articulos) {
        // Columna 1: Material
        page.graphics.drawRectangle(
          pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
          bounds: Rect.fromLTWH(4, yPosition, materialWidth, 50),
        );

        page.graphics.drawString(
          '     ${articulo.material}',
          PdfStandardFont(PdfFontFamily.helvetica, 14),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTWH(4, yPosition, materialWidth, 46),
          format: PdfStringFormat(
            alignment: PdfTextAlignment.left,
            lineAlignment: PdfVerticalAlignment.middle,
          ),
        );

        // Columna 2: Cantidad
        x = materialWidth;

        page.graphics.drawRectangle(
          pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
          bounds: Rect.fromLTWH(x + 4, yPosition, cantidadWidth, 50),
        );

        page.graphics.drawString(
          '         ${articulo.cantidad}             ',
          PdfStandardFont(PdfFontFamily.helvetica, 14),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTWH(x, yPosition, cantidadWidth, 46),
          format: PdfStringFormat(
            alignment: PdfTextAlignment.left,
            lineAlignment: PdfVerticalAlignment.middle,
          ),
        );

        // Columna 3: Descripción
        x = materialWidth + cantidadWidth;

        page.graphics.drawRectangle(
          pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
          bounds: Rect.fromLTWH(x + 4, yPosition, descriptionWidth, 50),
        );

        page.graphics.drawString(
          articulo.descripcion,
          PdfStandardFont(PdfFontFamily.helvetica, 13),
          brush: PdfBrushes.black,
          bounds: Rect.fromLTWH(x + 8, yPosition + 2, descriptionWidth, 46),
          format: PdfStringFormat(
            alignment: PdfTextAlignment.left,
            //lineAlignment: PdfVerticalAlignment.middle,
          ),
        );

        // Ajustar la posición para el siguiente artículo
        yPosition += 50;
      }

// Ajustar la posición para las siguientes secciones
      // yPosition += columnHeight;

// Añadir el borde negro alrededor del cliente
      x = 4;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth, columnHeight),
      );

// Añadir el texto del cliente dentro del borde
      page.graphics.drawString(
        'Despachado por: ${remision.despachado}',
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor de la fecha de factura
      x += columnWidth;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, columnWidth - 35, columnHeight),
      );

// Añadir el texto de la fecha de factura dentro del borde
      text = 'Recibido por: ${remision.recibido}';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

// Añadir el borde negro alrededor del número de remisión
      x += columnWidth - 35;
      page.graphics.drawRectangle(
        pen: PdfPen(PdfColor(0, 0, 0), width: borderWidth),
        bounds: Rect.fromLTWH(x, yPosition, 145, columnHeight),
      );

// Añadir el número de remisión dentro del borde
      text = 'Total: ${remision.totalPeso.toStringAsFixed(0)}KG';
      page.graphics.drawString(
        text,
        PdfStandardFont(PdfFontFamily.helvetica, 18, style: PdfFontStyle.bold),
        brush: PdfBrushes.black,
        bounds: Rect.fromLTWH(
          x + borderWidth,
          yPosition + borderWidth,
          columnWidth - 2 * borderWidth,
          columnHeight - 2 * borderWidth,
        ),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle),
      );

      List<int> bytes = await pdfDocument.save();
      pdfDocument.dispose();
      await saveAndLaunchFile(bytes, 'Output.pdf');
    } catch (e) {
      print('Error: $e');
    }
  }
}
