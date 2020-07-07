Paths
  The following methods can be used to manipulate paths of objects.

    CanvasRenderingContext2D.beginPath()
      Starts a new path by emptying the list of sub-paths. Call this method when you want to create a new path.

    CanvasRenderingContext2D.closePath()
      Causes the point of the pen to move back to the start of the current sub-path. It tries to draw a straight line from the current point to the start. If the shape has already been closed or has only one point, this function does nothing.

    CanvasRenderingContext2D.moveTo()
      Moves the starting point of a new sub-path to the (x, y) coordinates.

    CanvasRenderingContext2D.lineTo()
      Connects the last point in the current sub-path to the specified (x, y) coordinates with a straight line.

    CanvasRenderingContext2D.bezierCurveTo()
      Adds a cubic Bézier curve to the current path.

    CanvasRenderingContext2D.quadraticCurveTo()
      Adds a quadratic Bézier curve to the current path.

    CanvasRenderingContext2D.arc()
      Adds a circular arc to the current path.

    CanvasRenderingContext2D.arcTo()
      Adds an arc to the current path with the given control points and radius, connected to the previous point by a straight line.

    CanvasRenderingContext2D.ellipse()
      Adds an elliptical arc to the current path.

    CanvasRenderingContext2D.rect()
      Creates a path for a rectangle at position (x, y) with a size that is determined by width and height.