// -------------------------------------------------------------------------------------------------------------
// MIT License
// 
// Copyright 2022 KingUndeadCodes (https://www.github.com/KingUndeadCodes)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
// associated documentation files (the "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or substantial 
// portions of the Software.
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT 
// LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
// NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
// -------------------------------------------------------------------------------------------------------------
// CREDITS:
// 
// The following tools are used by this Software and ARE NOT written by the aforementioned copyright holder.
// Said tools are subjected to their own Licenses and policies.
// 
//  - https://github.com/openscad/MCAD/blob/master/triangles.scad <LGPL 2.1> (Triangle Module)
// 
// To read more about the LGPL 2.1, Please visit https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
// -------------------------------------------------------------------------------------------------------------

module Gear() {

    /**
     * Standard right-angled triangle
     *
     * @param number  o_len  Length of the opposite side
     * @param number  a_len  Length of the adjacent side
     * @param number  depth  How wide/deep the triangle is in the 3rd dimension
     * @param boolean center Whether to center the triangle on the origin
     * @todo a better way ?
     */
    module triangle(o_len, a_len, depth, center=true) {
        centroid = center ? [-a_len/3, -o_len/3,
    -depth/2] : [0, 0, 0];
        translate(centroid) linear_extrude(height=depth) {
            polygon(points = [[0,0], [a_len, 0], [0, o_len]], paths=[[0, 1, 2]]);
        }
    }
    
    radius = 10;
    multiple = 180/90;
    for (i = [0 : 75]) {
        // translate(i * 2, 0, 0)
        color("yellow")
        rotate([90, i*10 - 1, 0])
        triangle(4, 2, 1, center=true);
    }
}