# Copilot Instructions

## General Guidelines
- First general instruction
- Second general instruction

## Code Style
- Use specific formatting rules
- Follow naming conventions

## Project-Specific Rules
- The project's SiteNavigation table does not include a 'slug' column; navigation URLs should be built from the existing 'Navurl' column and Session["City"] placeholder replacement.
- When populating footer locations, default to the first child under the 'Programs' parent and use that child's Navurl as the page parameter; if the current route matches a program, use that program's child Navurl instead.
- The footer 'Location' should default to the first Programs child (use its Navurl and Title) and update when the page changes.
- Center the mega menu by positioning the dropdown relative to the page-width container.