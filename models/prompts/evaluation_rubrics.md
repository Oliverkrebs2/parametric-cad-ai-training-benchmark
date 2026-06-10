# CAD AI Training Evaluation Rubric

## 1. Parametric Quality

- Parameters are clearly named.
- Dimensions can be adjusted without breaking the model.
- Geometry updates predictably when values change.

## 2. CAD Correctness

- Model contains valid solid geometry.
- Holes are properly subtracted.
- Object is printable/exportable as STL or STEP.
- No obvious non-manifold geometry.

## 3. Mechanical Design Logic

- Hole placement is symmetric.
- Dimensions are realistic for a mechanical bracket.
- Thickness is appropriate for mounting use cases.

## 4. Code Quality

- CAD script is readable.
- Modules are reusable.
- Comments explain design intent.
- File can be opened and rendered in OpenSCAD.

## 5. AI Training Usefulness

- Prompt is clear and testable.
- Expected output features are measurable.
- Rubric supports pass/fail evaluation.
